From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Thu, 10 Apr 2014 15:44:01 +0000
Message-ID: <bug-73781-12968-tM7XqjnmRZ@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

--- Comment #2 from KATO Hiroshi <katoh@mikage.ne.jp> ---
commit eb8c68ef558e6cba241e7ada54f6b3427cb2bf68
Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date:   Mon Jan 27 22:50:35 2014 -0500

I reverted this patch and built module. And it doesn't seem to make any
difference.


commit cfc9c8ed03e4d908f2388af8815f44c87b503aaf
Author: Lukasz Majewski <l.majewski@samsung.com>
Date:   Fri Dec 20 15:24:50 2013 +0100

I can't revert this patch, because some rejects happened.


commit 6f19efc0a1ca08bc61841b971d8b85ab505d95c8
Author: Lukasz Majewski <l.majewski@samsung.com>
Date:   Fri Dec 20 15:24:49 2013 +0100

While building modules, many errors occured. So I didn't test this. 


I apologize for bothering you.

-- 
You are receiving this mail because:
You are the assignee for the bug.
