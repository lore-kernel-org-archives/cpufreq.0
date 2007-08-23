From: Dave Jones <davej@redhat.com>
Subject: Re: [Bugme-new] [Bug 8924] New: module speedstep-centrino does not
	load
Date: Wed, 22 Aug 2007 20:25:23 -0400
Message-ID: <20070823002523.GE18739@redhat.com>
References: <bug-8924-10286@http.bugzilla.kernel.org/> <20070822164451.1481d745.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759388AbXHWAZv@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070822164451.1481d745.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, frank@harenberg.ch

On Wed, Aug 22, 2007 at 04:44:51PM -0700, Andrew Morton wrote:
 > On Wed, 22 Aug 2007 15:12:09 -0700 (PDT)
 > bugme-daemon@bugzilla.kernel.org wrote:
 > 
 > > http://bugzilla.kernel.org/show_bug.cgi?id=8924
 > > 
 > >            Summary: module speedstep-centrino does not load
 > >            Product: Drivers
 > >            Version: 2.5
 > >      KernelVersion: 2.6.23-rc3
 > >           Platform: All
 > >         OS/Version: Linux
 > >               Tree: Mainline
 > >             Status: NEW
 > >           Severity: normal
 > >           Priority: P1
 > >          Component: Other
 > >         AssignedTo: drivers_other@kernel-bugs.osdl.org
 > >         ReportedBy: frank@harenberg.ch
 > > 
 > > 
 > > Most recent kernel where this bug did not occur:2.6.22
 > > Distribution:gentoo
 > > Hardware Environment: Intel Centrino Duo, cpu family 6, model 14, Model Name
 > > T2300 In a Dell Inspiron 9400.
 > > Software Environment: i386
 > > Problem Description: modprobe speedstep-centrino quits with error "no such
 > > device"
 > > same module loads successfully with older versions on the same computer.
 > > Steps to reproduce:
 > > modprobe speedstep-centrino
 > > 
 > 
 > I'd have thought that a lot of people would be seeing this?
 > 
 > Oh well.  Michal, can we please track this as a post-2.6.22 regression?

As mentioned in the now-closed bz, NOTABUG.

	Dave

-- 
http://www.codemonkey.org.uk
