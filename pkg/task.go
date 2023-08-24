// Copyright 2023 BINARY Members
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package pkg

// Max number of files can operate at once
const Max = 1000

var taskC = make(chan func(), Max)

// ExecuteTasks
// TODO: upgrade VIOLIN with unbounded queue and fix bug :(
func ExecuteTasks() {
	nums := len(taskC)
	for i := 0; i < nums; i++ {
		task := <-taskC
		task()
	}
}
