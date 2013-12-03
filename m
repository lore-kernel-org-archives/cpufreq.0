From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Tue, 03 Dec 2013 00:57:48 +0000
Message-ID: <bug-65671-12968-mCUUo3pqJs@https.bugzilla.kernel.org/>
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
                 CC|                            |lenb@kernel.org
            Summary|Problems with hibernation,  |hibernation - IO errors
                   |with bisect                 |writing to swap, crashing
                   |                            |apps, 3,11.8 worked

--- Comment #7 from Len Brown <lenb@kernel.org> ---
can you disable CONFIG_CPU_FREQ in your build of the latest kernel
to see if that helps?

-- 
You are receiving this mail because:
You are the assignee for the bug.
