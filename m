From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpufrequtils-0.3.tar.gz
Date: Sun, 25 Mar 2012 20:52:21 +0200
Message-ID: <20120325185221.GB26673@comet.dominikbrodowski.net>
References: <CA11D4D291418148B4814B9F023E3E2E0CDF08@MUCSE501.eu.infineon.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA11D4D291418148B4814B9F023E3E2E0CDF08@MUCSE501.eu.infineon.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas.Bartholomae@lantiq.com
Cc: cpufreq@vger.kernel.org

Thomas,

On Wed, Mar 21, 2012 at 09:34:33AM +0000, Thomas.Bartholomae@lantiq.com wrote:
> I implement already the linux cpufreq kernel driver onto our embedded linux
> system.
> On top of this I wanna install the cpufrequtils in userspace for easy
> access to the sysfs interface of the cpufreq driver.
> But if try to create a package out of the cpufrequtils-0.3.tar.gz with
> sysfs support I got a problem that a function from the
> necessary libsysfs is missing (sysfs_write_attribute_value).

cpufrequtils-0.3 is long deprecated. Either you can use the most recent
cpufrequtils release (cpufrequtils-008); the dependancy on libsysfs was
removed in 2008. Alternatively, you can use the new cpupowerutils included
in the Linux kernel sources ( tools/power/cpupower/ ).

Best,
	Dominik
