From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 13:21:29 +0000 (UTC)
Message-ID: <20130322132129.62FCC11FB81@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #18 from Borislav Petkov <bp@alien8.de>  2013-03-22 13:21:28 ---
On Fri, Mar 22, 2013 at 02:12:50PM +0100, Rafael J. Wysocki wrote:
> On Friday, March 22, 2013 05:45:29 PM Viresh Kumar wrote:
> > On 22 March 2013 17:47, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> > > OK, so what exactly do you need to now?
> > 
> > s/now/know ??
> 
> Yes, sorry.

Right, I heard about this breakage on Bulldozer and I can repro it here
too :(.

Which is not good and it needs to be fixed ASAP. From looking at the
patches in question, this should be reproducible on everything, though,
since it is generic cpufreq code. And if so, this makes the urgency of a
fix much more dire.

Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
