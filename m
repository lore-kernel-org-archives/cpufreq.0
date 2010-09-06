From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Mon, 6 Sep 2010 10:46:21 GMT
Message-ID: <201009061046.o86AkLgD009484@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #16 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-09-06 10:46:19 ---
Yes, I do compile kernels myself. The distro kernels usually are patched and
contain back-ports of all kind, so filing a bug report on bugzilla.kernel.org
with a distro kernel is somewhat pointless I figure...
On top of that I only include drivers and features I need and usually compile
the stuff in - the Linux kernel was designed to be a monolithic kernel, not a
microkernel. ;)

If you want to add some more debugging printks to the ondemand governor
sources, just send me a patch or tell me where I should put them. Although I
guess this will be tricky for me to do right, since you know what you'd like to
see and I'm not a kernel hacker... (I know how to read C and can write small C
programs, but I'm not a professional programmer or something like that)

And here's a bit of a problem: 2.6.27.* still does have EXT4 marked as
experimental, will this work with current EXT4 file systems or am I going to
run into some serious trouble when running this kernel? (My root partition is
an EXT4 partition, and obviously I didn't pay attention when I installed the
system...seems Debian Squeeze uses EXT4 as default FS already?!)
Second problem: 2.6.36-rc3 won't compile, I'm getting an implicit declaration
error in the i915 DRM driver...

Do you think trying 2.6.28 instead of .27 could help since EXT4 was marked
stable in .28 if I recall this right.
Or have there been major changes in the CPUFREQ code after 2.6.27?

I'll tweak my .config to include CPUFREQ as modules as you suggested for now.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
