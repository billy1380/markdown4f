//
//  AbstractAsyncPlugin.java
//  markdown4j-gwt
//
//  Created by William Shakour (billy1380) on 3 Jan 2015.
//  Copyright © 2015 WillShex Limited. All rights reserved.
//
package org.markdown4j.client;

import org.markdown4j.Plugin;

import com.google.gwt.event.shared.HandlerManager;

/**
 * @author William Shakour (billy1380)
 *
 */
public abstract class AbstractAsyncPlugin extends Plugin {
	protected HandlerManager manager;

	public AbstractAsyncPlugin(String idPlugin, HandlerManager manager) {
		super(idPlugin);
		this.manager = manager;
	}

}
