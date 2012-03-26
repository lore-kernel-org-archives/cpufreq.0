From: "Bartholomae Thomas (LQDE CPE AE SW)" <Thomas.Bartholomae@lantiq.com>
Subject: RE: cpufrequtils-0.3.tar.gz
Date: Mon, 26 Mar 2012 08:04:11 +0000
Message-ID: <644A92022E74034C81F5B232BA81D9EC8577@MUCSE039.lantiq.com>
References: <CA11D4D291418148B4814B9F023E3E2E0CDF08@MUCSE501.eu.infineon.com>
 <20120325185221.GB26673@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120325185221.GB26673@comet.dominikbrodowski.net>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>, "Bartholomae Thomas (LQDE CPE AE SW)" <Thomas.Bartholomae@lantiq.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hi Dominik,

many thanks for your answer. Meanwhile I tried already the version 008 and it works fine for me.
Your answer confirm me that I'm using the correct version.
The version number confused me bit ;-)
Cheers Thomas



-----Original Message-----
From: Dominik Brodowski [mailto:linux@dominikbrodowski.net] 
Sent: Sunday, March 25, 2012 8:52 PM
To: Bartholomae Thomas (LQDE CPE AE SW)
Cc: cpufreq@vger.kernel.org
Subject: Re: cpufrequtils-0.3.tar.gz

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
