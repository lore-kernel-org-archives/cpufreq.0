From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62861] Maximum CPU voltage level never reached on AMD A8-5500
 if radeon.dpm=1 is used
Date: Sat, 19 Oct 2013 13:13:52 +0000
Message-ID: <bug-62861-12968-Bu8h26eP5J@https.bugzilla.kernel.org/>
References: <bug-62861-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-62861-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62861

Kertesz Laszlo <laszlo.kertesz@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Product|Power Management            |Drivers
            Summary|Maximum CPU voltage level   |Maximum CPU voltage level
                   |never reached on AMD        |never reached on AMD
                   |A8-5500                     |A8-5500 if radeon.dpm=1 is
                   |                            |used
          Component|cpufreq                     |Video(DRI - non Intel)

--- Comment #4 from Kertesz Laszlo <laszlo.kertesz@gmail.com> ---
This issue is related to the radeon driver's dpm code.
If i dont append radeon.dpm=1 to the kernel boot options, i have 0.9-1.34v and
correct CPU speeds (including torbo boost).

-- 
You are receiving this mail because:
You are the assignee for the bug.
