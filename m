From: J Webster <jw.jwebster@gmail.com>
Subject: Re: speed throttle to 800 cpufreq Ocelot
Date: Tue, 14 Feb 2012 21:30:44 +0000
Message-ID: <4F3AD284.8010902@gmail.com>
References: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com> <20120213193425.GA2455@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=wtOFWufJHRATy2nL9kvDHan4NzsFd9PEic6wZEBR+Fw=;
        b=Ei0++a25yOnraQh8IZv8/0WOh60uPhrHNhZDe2XWP+h4C76zHx3EB298KL71OE3o4I
         2j723Ooj2z4KPvq2QoXSeKqiYoa9X3QuBg1yw5mn7O8Vw2J9MfYeiI0BMGKMGGfScc0e
         mBGIhuQQoi4wax9VGedENgrN6eT+gYnjeQWf4=
In-Reply-To: <20120213193425.GA2455@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

I tried sudo modprobe speedstep-smi but it didn;t change the driver at all.
hwinfo --cpu

 > hal.1: read hal dataprocess 3424: arguments to dbus_move_error() were 
incorrect, assertion "(dest) == NULL || !dbus_error_is_set ((dest))" 
failed in file ../../dbus/dbus-errors.c line 280.
This is normally a bug in some application using the D-Bus library.
libhal.c 3483 : Error unsubscribing to signals, error=The name 
org.freedesktop.Hal was not provided by any .service files
01: None 00.0: 10103 CPU
[Created at cpu.304]
Unique ID: rdCR.j8NaKXDZtZ6
Hardware Class: cpu
Arch: Intel
Vendor: "GenuineIntel"
Model: 6.13.8 "Intel(R) Pentium(R) M processor 1.73GHz"
Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,mtrr,pge,m 
ca,cmov,clflush,dts,acpi,mmx,fxsr,sse,sse2,ss,tm,p be,nx,up,bts,est,tm2
Clock: 600 MHz
BogoMips: 1595.82
Cache: 2048 kb
Config Status: cfg=new, avail=yes, need=no, active=unknown


On 02/13/2012 07:34 PM, Dave Jones wrote:
> On Mon, Feb 13, 2012 at 07:11:30PM +0000, J Webster wrote:
>   >  This problem first occurred 1 year ago on Maverick Meerkat.
>   >  I just upgr
>   >     driver: p4-clockmod
>
> don't use this driver. it's nothing but disappointment and doesn't save you power.
>
> I see the inspiron 9300 has a pentium M. Some of these lacked EST iirc,
> so you're probably completely out of luck, and can't scale clock speed.
>
> 	Dave
>
