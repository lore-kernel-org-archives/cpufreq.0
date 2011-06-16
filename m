From: "John R. Dunning" <jrd@jrd.org>
Subject: Info request for cpufreq on asus b202
Date: Thu, 16 Jun 2011 19:01:09 -0400
Message-ID: <19962.35637.391148.301601@bioraptor.jrd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hi all.  I'm trying to get cpufreqd working on my asus b202, atom N270
processor.  I'm running gentoo, kernel 2.6.37, cpufreq 2.4.2.

I've got my kernel configed to allow scaling, all the governors turned
on etc.  But when I run cpufreqd, and it tries to set the ondemand or
conservative govs, that seems to fail, and I end up with performance.
A bit of fiddling, by hand and by changing configs of cpufreqd,
reveals that the only govs that seem to be settable are powersave,
performance, and userspace.

I suspect that the core issue is either that I've somehow got my
kernel misconfigured, or that there's something about the N270 which
precludes using either of the dynamic governors.  I'm hoping somebody
on this list will have some insight into how to get freq scaling, and
cpufreqd in particular, working "correctly" on this hardware.

Thanks in advance for any info...
