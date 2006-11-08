From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Wed, 8 Nov 2006 18:29:55 -0500
Message-ID: <20061108232955.GL3309@redhat.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
	<200611070209.39817.len.brown@intel.com>
	<20061107184902.GA11620@us.ibm.com>
	<20061108232119.GB28012@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061108232119.GB28012@us.ibm.com>
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
To: Gary Hade <garyhade@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Wed, Nov 08, 2006 at 03:21:19PM -0800, Gary Hade wrote:

 > The above result was obtained with Woodcrest processors 
 > installed in the system.  With Dempsey processors the 
 > address space is ACPI_ADR_SPACE_SYSTEM_IO and the 2.6.19-rc4 
 > version of acpi-cpufreq loads and functions correctly.
 > 
 > The patch I provided modifies the in-kernel copy of the ACPI 
 > data which is the wrong thing to do.  I will post an improved 
 > patch as soon as the Woodcrests are reinstalled and I am able 
 > to test it.

Argh. I sat on the fence on this one until the dest settled,
and now, as soon as I merge it, this happens. Bah!

Send an incremental against cpufreq.git so I don't have to
reconstruct the whole git tree?  Or is the right change completely
different, causing a complete revert of this?

		Dave

-- 
http://www.codemonkey.org.uk
