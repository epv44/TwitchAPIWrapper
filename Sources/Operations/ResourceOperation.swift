//
//  ResourceOperation.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//
/*
import Foundation
public final class ResourceOperation<ResourceService: ResourceServiceType>: BaseOperation, ResourceOperationType {
    
    public typealias Resource = ResourceService.Resource
    public typealias DidFinishFetchingResourceCallback = (ResourceOperation<ResourceService>, Result<Resource.Model>) -> Void
    
    fileprivate let resource: Resource
    fileprivate let service: ResourceService
    fileprivate let didFinishFetchingResourceCallback: DidFinishFetchingResourceCallback
    
    public init(resource: ResourceService.Resource, service: ResourceService = ResourceService(), didFinishFetchingResourceCallback: @escaping DidFinishFetchingResourceCallback) {
        self.resource = resource
        self.service = service
        self.didFinishFetchingResourceCallback = didFinishFetchingResourceCallback
        super.init()
    }
    
    public func fetch<Service: ResourceServiceType>(resource: Resource, using service: Service) where Service.Resource.Model == Resource {
        if isCancelled { return }
        
        service.fetch(resource: resource, completion: { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                if strongSelf.cancelled { return }
                strongSelf.finish(errors: [])
                strongSelf.didFinishFetchingResource(with: result)
            }
            })
    }
    
    
    override public func execute() {
        fetch(resource: resource, using: service)
    }
    
    public func didFinishFetchingResource(with result: Result<Resource.Model>) {
        didFinishFetchingResourceCallback(self, result)
    }
}
*/
