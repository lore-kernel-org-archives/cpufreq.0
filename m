From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bugme-new] [Bug 8924] New: module speedstep-centrino does not
 load
Date: Wed, 22 Aug 2007 16:44:51 -0700
Message-ID: <20070822164451.1481d745.akpm@linux-foundation.org>
References: <bug-8924-10286@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933535AbXHVXpY@vger.kernel.org>
In-Reply-To: <bug-8924-10286@http.bugzilla.kernel.org/>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: bugme-daemon@bugzilla.kernel.org, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, frank@harenberg.ch

On Wed, 22 Aug 2007 15:12:09 -0700 (PDT)
bugme-daemon@bugzilla.kernel.org wrote:

> http://bugzilla.kernel.org/show_bug.cgi?id=8924
> 
>            Summary: module speedstep-centrino does not load
>            Product: Drivers
>            Version: 2.5
>      KernelVersion: 2.6.23-rc3
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Other
>         AssignedTo: drivers_other@kernel-bugs.osdl.org
>         ReportedBy: frank@harenberg.ch
> 
> 
> Most recent kernel where this bug did not occur:2.6.22
> Distribution:gentoo
> Hardware Environment: Intel Centrino Duo, cpu family 6, model 14, Model Name
> T2300 In a Dell Inspiron 9400.
> Software Environment: i386
> Problem Description: modprobe speedstep-centrino quits with error "no such
> device"
> same module loads successfully with older versions on the same computer.
> Steps to reproduce:
> modprobe speedstep-centrino
> 

I'd have thought that a lot of people would be seeing this?

Oh well.  Michal, can we please track this as a post-2.6.22 regression?

Thanks.
