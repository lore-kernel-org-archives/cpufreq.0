From: "davej@redhat.com" <davej@redhat.com>
Subject: Re: sfi based cpufreq driver for intel soc platforms
Date: Wed, 1 Feb 2012 09:51:34 -0500
Message-ID: <20120201145133.GA15100@redhat.com>
References: <C9B248CF4BE2844B92616616440223E8049984@BGSMSX101.gar.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C9B248CF4BE2844B92616616440223E8049984@BGSMSX101.gar.corp.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rudramuni, Vishwesh M" <vishwesh.m.rudramuni@intel.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Seshadri, Harinarayanan" <harinarayanan.seshadri@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Brown, Len" <len.brown@intel.com>

On Wed, Feb 01, 2012 at 10:59:49AM +0000, Rudramuni, Vishwesh M wrote:

 > +config X86_SFI_CPUFREQ
 > +        tristate "SFI Processor P-States driver"
 > +        select CPU_FREQ_TABLE
 > +        help
 
...

 >  obj-$(CONFIG_X86_POWERNOW_K8)		+= powernow-k8.o mperf.o
 >  obj-$(CONFIG_X86_ACPI_CPUFREQ)		+= acpi-cpufreq.o mperf.o
 > +obj-$(CONFIG_X86_ACPI_CPUFREQ)		+= sfi-cpufreq.o mperf.o
 >  obj-$(CONFIG_X86_PCC_CPUFREQ)		+= pcc-cpufreq.o
 >  obj-$(CONFIG_X86_POWERNOW_K6)		+= powernow-k6.o
 >  obj-$(CONFIG_X86_POWERNOW_K7)		+= powernow-k7.o

This should be 

+obj-$(CONFIG_X86_SFI_CPUFREQ)              += sfi-cpufreq.o mperf.o

I assume ?


	Dave
