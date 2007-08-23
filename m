From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8924] module speedstep-centrino does not load
Date: Wed, 22 Aug 2007 17:05:20 -0700 (PDT)
Message-ID: <20070823000520.E39A110802E@picon.linux-foundation.org>
References: <bug-8924-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8924-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8924





------- Comment #6 from ismail@pardus.org.tr  2007-08-22 17:12 -------
On Thursday 23 August 2007 02:44:51 Andrew Morton wrote:
> On Wed, 22 Aug 2007 15:12:09 -0700 (PDT)
>
> bugme-daemon@bugzilla.kernel.org wrote:
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
> > Hardware Environment: Intel Centrino Duo, cpu family 6, model 14, Model
> > Name T2300 In a Dell Inspiron 9400.
> > Software Environment: i386
> > Problem Description: modprobe speedstep-centrino quits with error "no
> > such device"
> > same module loads successfully with older versions on the same computer.
> > Steps to reproduce:
> > modprobe speedstep-centrino
>
> I'd have thought that a lot of people would be seeing this?
>
> Oh well.  Michal, can we please track this as a post-2.6.22 regression?

Also can be reproduced on "Intel(R) Core(TM)2 Duo CPU     T7300  @ 2.00GHz, 
cpu family 6, model 15" . Btw acpi-cpufreq works fine.

Regards,
ismail


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
