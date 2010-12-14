From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 24562] k8-powernow does not see all cores
Date: Tue, 14 Dec 2010 11:26:24 GMT
Message-ID: <201012141126.oBEBQOh6028011@demeter1.kernel.org>
References: <bug-24562-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-24562-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=24562


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
                 CC|                            |trenn@suse.de
         Resolution|                            |CODE_FIX
         AssignedTo|cpufreq@vger.kernel.org     |trenn@suse.de




--- Comment #12 from Thomas Renninger <trenn@suse.de>  2010-12-14 11:26:22 ---
> This is confusing, this can be read as: core 0, currently on 3200 MHz, core 1
> currently on 2400 MHz, etc, with cores 4 and 5 not seen.
I expect you mean the new message on "boostable" CPUs which is unrelated to the
rest:
> powernow-k8: Core Performance Boosting: on.
can get mixed up with below:
> powernow-k8:    0 : pstate 0 (3200 MHz)
> powernow-k8:    1 : pstate 1 (2400 MHz)
especially the "Core performance" string by bad luck looks related:
Core Performance
0 :  pstate 0
1 :  pstate 1

I agree that this is a bit confusing and Rui's first part of the patch should
be sufficient:
             if (cpu_family == CPU_HW_PSTATE) {
                 printk(KERN_INFO PFX
-                    "   %d : pstate %d (%d MHz)\n", j,
+                    "   pstate %d (%d MHz)\n",
                     data->powernow_table[j].index,
                     data->powernow_table[j].frequency/1000);

In the other case this message:
> powernow-k8: Core Performance Boosting: on.
doesn't appear anyway and the message has another format and the bit removed by
Rui has some meaning.

But this is a really minor bug.
I hope I do not forget about it and I will add Rui's first part if I have other
cpufreq patches in the queue -> I set this one resolved already.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
