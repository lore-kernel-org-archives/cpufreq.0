From: Dave Jones <davej@redhat.com>
Subject: proposed sysfs semantic change.
Date: Wed, 11 Aug 2010 17:54:43 -0400
Message-ID: <20100811215443.GA28343@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Users with dual/quad core systems can currently set individual cores to
have different governors (and drivers!), which doesn't really make a lot
of sense.

I'm thinking of changing things so scaling_governor file for the 2nd/3rd/4th etc
cores is a symlink to the same file in cpu0/
So a write to one file will automatically set things on all related cores within
the same package.

For completeness we could also symlink related_cpus and driver.

thoughts ?

	Dave

