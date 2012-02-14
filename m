From: Dave Jones <davej@redhat.com>
Subject: Re: speed throttle to 800 cpufreq Ocelot
Date: Tue, 14 Feb 2012 18:11:48 -0500
Message-ID: <20120214231148.GA13981@redhat.com>
References: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com>
 <20120213193425.GA2455@redhat.com>
 <4F3AD284.8010902@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F3AD284.8010902@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <jw.jwebster@gmail.com>
Cc: cpufreq@vger.kernel.org

On Tue, Feb 14, 2012 at 09:30:44PM +0000, J Webster wrote:
 > I tried sudo modprobe speedstep-smi but it didn;t change the driver at all.
 > hwinfo --cpu

-smi is for ancient hardware. 

 > Hardware Class: cpu
 > Arch: Intel
 > Vendor: "GenuineIntel"
 > Model: 6.13.8 "Intel(R) Pentium(R) M processor 1.73GHz"
 > Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,mtrr,pge,m 
 > ca,cmov,clflush,dts,acpi,mmx,fxsr,sse,sse2,ss,tm,p be,nx,up,bts,est,tm2

oh, so your cpu does have est. It should be using acpi-cpufreq driver.

	Dave

