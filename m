From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Tue, 11 Feb 2014 00:52:41 +0000
Message-ID: <bug-69821-12968-luOmODzYU8@https.bugzilla.kernel.org/>
References: <bug-69821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-69821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69821

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lenb@kernel.org

--- Comment #1 from Len Brown <lenb@kernel.org> ---
just curious, why are you using CONFIG_HZ_PERIODIC=y ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
