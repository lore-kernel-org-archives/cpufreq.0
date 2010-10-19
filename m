From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 03:12:01 GMT
Message-ID: <201010190312.o9J3C1Zf008703@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #21 from Thomas Renninger <trenn@suse.de>  2010-10-19 03:11:56 ---
Created an attachment (id=34092)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=34092)
Patch introducing boot param to disable HW_COORD type

Please try:
processor.disable_hw_coord=1
boot param with this patch.
Hm, pdc is called rather early these days. The param won't be considered for
the first _PDC call in arch/x86/kernel/acpi/boot.c.
But that should not matter and I hope it gets used later, otherwise it must be
an early param...
I try to come up with another patch to export the coordination type to be able
to check this...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
