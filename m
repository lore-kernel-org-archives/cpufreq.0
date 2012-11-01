From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49881] Missing NULL check of return value of cpufreq_cpu_get()
 in function cpufreq_add_dev_symlink()
Date: Thu,  1 Nov 2012 14:22:49 +0000 (UTC)
Message-ID: <20121101142249.8B6E111FB83@bugzilla.kernel.org>
References: <bug-49881-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49881-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49881


Alan <alan@lxorguk.ukuu.org.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|HotPlug                     |cpufreq
         AssignedTo|greg@kroah.com              |cpufreq@vger.kernel.org
            Product|Drivers                     |Power Management




-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
