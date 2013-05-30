From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 16:05:03 +0000 (UTC)
Message-ID: <20130530160503.8210D11FB5D@bugzilla.kernel.org>
References: <bug-58761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58761


Viresh Kumar <viresh.kumar@linaro.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rjw@sisk.pl




--- Comment #12 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-30 16:05:03 ---
(In reply to comment #11)
> > Why I removed it was: "Nobody is making use of this information and was turning
> > out to be more misleading".. As "hardware" for kernel is whatever is present
> > below kernel layer.. So, if the layers below linux don't want to hide that
> > information, let it be.
> 
> I have actually been using these files for while for a project related with
> energy in order to decide which cores have a physical correlation with respect
> to frequency transition. So if I get it right, it is not possible to have such
> information anymore.

Yeah.. I am not sure if it is worth to add another field (only for
acpi-cpufreq) to get this information back.. 

@Rafael: ??

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
