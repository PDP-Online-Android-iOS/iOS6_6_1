//
//  ContentView.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 05/12/22.
//

import SwiftUI

struct ContentView: View {
    
    func apiEmployeeList() {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success :
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiCreateEmployee() {
        AFHttp.post(url: AFHttp.API_EMPLOYEE_CREATE, params: AFHttp.paramsEmployeeCreate(employee: EmployeeData(id: 1, employee_name: "Ogabek", employee_salary: 300, employee_age: 19)), handler: { response in
            switch response.result {
            case .success :
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiUpdateEmployee() {
        AFHttp.put(url: AFHttp.API_EMPLOYEE_UPDATE + "1", params: AFHttp.paramsEmployeeUpdate(employee: EmployeeData(id: 1, employee_name: "Ogabek", employee_salary: 300, employee_age: 19)), handler: { response in
            switch response.result {
            case .success :
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiDeleteEmployee() {
        AFHttp.del(url: AFHttp.API_EMPLOYEE_DELETE + "1", params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success :
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    apiEmployeeList()
                }, label: {
                    Text("Employee List")
                }).padding()
                
                Button(action: {
                    apiCreateEmployee()
                }, label: {
                    Text("Create Employee")
                }).padding()
                
                Button(action: {
                    apiUpdateEmployee()
                }, label: {
                    Text("Update Employee")
                }).padding()
                
                Button(action: {
                    apiDeleteEmployee()
                }, label: {
                    Text("Delete Employee")
                }).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
