From: Alan Stern <stern@rowland.harvard.edu>
Subject: cpufreq notifier initialization
Date: Fri, 28 Jul 2006 17:19:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0607281710090.5679-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161305AbWG1VTH@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk
Cc: Kernel development list <linux-kernel@vger.kernel.org>

I want to modify the cpufreq_transition_notifier_list.  Currently it is a
source of problems during swsusp, because the suspend and resume methods
invoke the notifier chain at a time when the down_read() operation
protecting the chain is not legal.

If the notifier chain is protected by SRCU ("Sleepable RCU", recently
added to -mm) instead of an rwsem, the problems would go away.  However 
SRCU requires runtime initialization.  This means the notifier chain's 
head has to be initialized before any listeners register on it and before 
the chain is ever invoked.

Can anyone tell me where a good place would be to do the initialization?  
It has to be early enough that nobody has used the transition notifier 
list but late enough that per-CPU data can be allocated.

Alan Stern
