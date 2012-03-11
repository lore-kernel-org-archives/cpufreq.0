From: "Roland Kletzing" <devzero@web.de>
Subject: [BUG] - system freezes on via nehemia platform caused by longhaul module
Date: Sun, 11 Mar 2012 12:45:11 +0100
Message-ID: <26259A6E9F2C40E386E93FCC55F0ED5C@samsungnetbook>
References: <trinity-40a7fb2e-f29f-46e2-8e41-b855a2b0eb03-1331432690679@3capp-webde-bs48.dlan.cinetic.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <trinity-40a7fb2e-f29f-46e2-8e41-b855a2b0eb03-1331432690679@3capp-webde-bs48.dlan.cinetic.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: cpufreq@vger.kernel.org
Cc: linux@brodo.de, davej@redhat.com, h.reuver@mantell.xs4all.nl

Sorry, need to repost, as my stupid webmailer only sends html and that is 
bouncing on cpufreq ML.

Hello,
longhaul module is causing system freeze on our Fablabs Neoware Thin-Clients 
with Nehemia CPU. We were trying to update from TinyCore Linux 3.x to 4.x 
today.

The freeze happens very soon after booting the live/install-media of 
TinyCore 4.x, at least within 2 minutes after starting to work with the gui. 
Silent freeze, btw. No Oops, no nothing!

Apparently (depending on revision number), some of our Neoware`s come with 
Via Ezra, some with Via Nehemia CPU. That was the "pattern" we found after 
debugging and searching for hours for finding the cause of the freeze with 
Tinycore 4.x

Finally,
https://bugzilla.kernel.org/show_bug.cgi?id=4059  (  cpufreq longhaul for 
Via Nehemiah C (C5N) freezes whole system  )

and
http://webcache.googleusercontent.com/search?q=cache:MO_GdcMW5mgJ:forums.debian.net/viewtopic.php%3Ff%3D7%26t%3D59677+longhaul+nehemiah+freeze&cd=1&hl=de&ct=clnk&gl=de&client=firefox-a 
(needed to provide a cached link as the debian forum is under maintenance 
for now)

gave the hint and a few moments later, adding "longhaul.disable=1" to the 
kernel commandline did the trick - systems stable again!

Here`s one more user being hit by that:
http://www.spinics.net/lists/cpufreq/msg00137.html

As tinycore 4.x comes with linux kernel 3.0.3+ something must have have 
changed either in the Tinycore build or in the way kernel 3.x is loading 
modules or detecting hardware, as TinyCore 3.x never had a problem on that 
machines (as it did not load longhaul)

Could the module please either be fixed or a quirk being added so others 
will not be affected ?  What about marking that module as broken or at least 
add a hint in Kconfig? (Nehemia is not mentioned there). Otherwise, i 
strongly suggest Bugzilla #4059 to be reopened.

regards
Roland

neoware:/tmp # cat /proc/cpuinfo
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 9
model name      : VIA Nehemiah
stepping        : 8
cpu MHz         : 797.944
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr cx8 sep mtrr pge cmov pat mmx fxsr 
sse up rng rng_en ace ace_en
bogomips        : 1595.88
clflush size    : 32
power management: 

