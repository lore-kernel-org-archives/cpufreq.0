From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 2 Nov 2010 07:09:07 GMT
Message-ID: <201011020709.oA2797mT001546@demeter2.kernel.org>
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





--- Comment #40 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-11-02 07:09:00 ---
Seems like I am lucky in picking the broken CPUs...the Core2 Quad Q9550 I have
also has a minor flaw, it has broken temperature sensors - those are stuck at
one temperature, no matter how much load I put on it :-P
BTW, I never overclocked or fiddled with any of those CPUs and bought them
unused and new...

So, do you need anything else from me?
If it helps, with the patched kernel CPU frequency scaling tends to be a little
slower to ramp the freq up and scales down a little earlier compared to the
unpatched kernel with lowered up_threshold. So system responsiveness is a bit
worse. You notice that, but its not too bad, it definitely WORKS as it's
supposed to. I'm now probably saving a bit of power compared to before.

Thanks for looking into this again! If you want me to try more sophisticated
patches just let me know.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
