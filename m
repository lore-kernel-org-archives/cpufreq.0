From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Fri, 13 Jun 2014 21:23:01 +0000
Message-ID: <bug-77201-12968-7ZUkE3JZu7@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #74 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
(In reply to Viresh Kumar from comment #72)
> (In reply to Viresh Kumar from comment #45)
> > I don't have a clue why does it depend on that :(
> 
> Now, I know why. This can very much be some ACPI issue considering so much
> dependency it has on it and I am not good at ACPI :(
> 
> 631e8ac powernow-k8: Add a kconfig dependency on acpi-cpufreq

It looks like the relevant routine doesn't do anything ACPI-related
at all.  It accesses MSRs directly  it seems.

-- 
You are receiving this mail because:
You are the assignee for the bug.
