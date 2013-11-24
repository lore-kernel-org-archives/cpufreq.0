From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Sun, 24 Nov 2013 07:16:23 +0000
Message-ID: <bug-65301-12968-FWwvS53kad@https.bugzilla.kernel.org/>
References: <bug-65301-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65301-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65301

tomasi <tomas.ivanek@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tomas.ivanek@gmail.com

--- Comment #1 from tomasi <tomas.ivanek@gmail.com> ---
I can confirm on Lenovo T440s with Intel(R) Core(TM) i5-4200U CPU @ 1.60GHz

after resume cpu is set on max

bio@dell-xps:/sys/devices/system/cpu/cpu0/cpufreq$ sudo cat cpuinfo_cur_freq
2543476

Linux dell-xps 3.12.0-031200-generic #201311031935 SMP Mon Nov 4 00:36:54 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.
