From: "Chen, Kenneth W" <kenneth.w.chen@intel.com>
Subject: RE: add lowpower_idle sysctl
Date: Thu, 25 Mar 2004 11:20:58 -0800
Sender: linux-ia64-owner@vger.kernel.org
Message-ID: <200403251920.i2PJKwF25849@unix-os.sc.intel.com>
References: <405A29EA.6000400@mvista.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <405A29EA.6000400@mvista.com>
List-Id: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Todd Poynor' <tpoynor@mvista.com>
Cc: linux-ia64@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, CPU Freq ML <cpufreq@www.linux.org.uk>

>>>>> Todd Poynor wrote on Thu, March 18, 2004 3:00 PM
> I'd vote for using Patrick Mochel's PM subsystem and use a standard
> set of identifiers that are mapped to a platform-specific idle behavior,
> in  much the same way as platform suspend modes are handled today.  For
> example, strings echoed to /sys/power/idle could be an interface.  If
> folks are amenable to this I'd be happy to supply a (generic) patch for it.

Just wondering what is the state of development for this new PM scheme?
I don't check LKML that frequently, sorry if I miss any posting on LKML.

- Ken


