From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked, unless rmmod powernow_k8
Date: Tue, 25 Mar 2014 00:25:57 +0000
Message-ID: <bug-65671-12968-9MNSqc3bHJ@https.bugzilla.kernel.org/>
References: <bug-65671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65671

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|hibernation - IO errors     |hibernation - IO errors
                   |writing to swap, crashing   |writing to swap, crashing
                   |apps, 3,11.8 worked         |apps, 3,11.8 worked, unless
                   |                            |rmmod powernow_k8

--- Comment #13 from Len Brown <lenb@kernel.org> ---
> No compatible ACPI _PSS objects found.

Whelp, at least we know it isn't an ACPI bug:-)

This seems to be specific to powernow_k8 -- is it possible to bisect
but only changes within that driver?

-- 
You are receiving this mail because:
You are the assignee for the bug.
