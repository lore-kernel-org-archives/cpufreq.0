From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 70941] New: 'powersave' performance excessively slow on Dell
 Venue 8 Pro (Baytrail tablet)
Date: Fri, 21 Feb 2014 08:53:02 +0000
Message-ID: <bug-70941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70941

            Bug ID: 70941
           Summary: 'powersave' performance excessively slow on Dell Venue
                    8 Pro (Baytrail tablet)
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.14rc3
          Hardware: i386
                OS: Linux
              Tree: Fedora
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: awilliam@redhat.com
        Regression: No

I've noticed recent 3.14 kernels perform extremely sluggishly on my Venue 8 Pro
(Baytrail-based tablet). Doing 'echo performance >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor' speeds things right up
again: default is 'powersave'.

Obviously performance will be faster, but powersave seems really egregiously
slow. Just stuff like paging through console output at a VT is incredibly
sluggish - I can run 'journalctl -b', hit End, and watch it draw one painful
line at a time.

The scaling_driver is 'intel_pstate' . I think pstate stuff may have been
broken on baytrail for a while - I had to boot with intel_pstate=disable for a
bit, and before that it may just not have been kicking in - which is probably
why I didn't notice this until rc2 or so.

The frequency range is 200MHz->1.6GHz with both 'powersave' and 'performance'.
I'm not sure what's the best way to watch the scaling kick in, but using
powertop or just spamming 'cat
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq' , it does seem to scale
up rather faster with performance.

Not sure what info is needed to help debug this, just ask and I'll provide.

-- 
You are receiving this mail because:
You are the assignee for the bug.
