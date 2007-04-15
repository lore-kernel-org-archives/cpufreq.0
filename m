From: Roberto Gordo Saez <roberto.gordo@gmail.com>
Subject: Voltage tweaking in powernow_k8
Date: Sun, 15 Apr 2007 19:18:10 +0200
Message-ID: <20070415171810.GA3096@thing.nowhere>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:date:from:to:subject:message-id:mail-followup-to:mime-version:content-type:content-disposition:user-agent;
	b=W4o6ZMaJdtFuE6to6z8anLoU1ZEXvxVHKK62DRRH7G9VV71k7obOGvSuajwrCvpRDfhXmLyE8PmG2o29giHosFw/D+K+QdJ1jwXRv5AKC6/yNd0vHupJTOsbYtLQRh1HLBzoT9nGuV6Mj2pbcZsKV6qK4HU1qx2K4hbCaAN63U4=
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hi. What do you think about adding a way to perform voltage corrections
into the powernow-k8 module? I've been using a custom (hacked)
powernow-k8.c since months, because my motherboard wrongly provides
always more voltage than is required by my Turion 64 processor, giving
an unwanted overvolting and much more heat.

There is also a patch (unknown author) that provides a new parameter to
the module:

http://people.fh-landshut.de/~sprecht/gentoo/powernow-k8-vcore_list-2.6.18.patch

It adds the parameter vcore_list that can be used to override voltages
provides by BIOS. It seems to work ok (at least for me). Some people
use this patch to perform undervolting, but there are also many broken
motherboards giving wrong voltage (mostly for Turions).

For example, this is my particule case:

 modprobe powernow_k8 vcore_list=1200,900

 powernow-k8: Found 1 AMD Turion(tm) 64 Mobile Technology MT-30
 processors (version 2.00.00)
 powernow-k8: Requested Voltage for id0 is 1200 mV default voltage is 1300
 powernow-k8: Performing required adjustment of 100 mV  or 4 25mV steps
 powernow-k8: Requested Voltage for id1 is 900 mV default voltage is 1000
 powernow-k8: Performing required adjustment of 100 mV  or 4 25mV steps
 powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0xe
 powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1a

I agree that the patch does look a bit ugly, but I find it easier and
more convenient than to hack into the ACPI values.

It is possible to get something like this into the mainline?
