From: Mattia Dongili <malattia@linux.it>
Subject: Re: 2.6.19-rc5-mm2
Date: Wed, 15 Nov 2006 19:36:10 +0100
Message-ID: <20061115183610.GA4812@inferi.kami.home>
References: <EB12A50964762B4D8111D55B764A8454E4128E@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030834AbWKOSgj@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454E4128E@scsmsx413.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: ego@in.ibm.com, Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, "Sadykov, Denis M" <denis.m.sadykov@intel.com>

On Wed, Nov 15, 2006 at 10:06:23AM -0800, Pallipadi, Venkatesh wrote:
[...]
> >Venki, I'm a little worried about the switch/case in question (line
> >702): the data->cpu_feature is set either to SYSTEM_IO_CAPABLE or
> >SYSTEM_INTEL_MSR_CAPABLE just a few lines above so it seems the switch
> >variable is wrong and none of the 2 cases will ever get a chance to
> >execute.
> >
> 
> The variable is set few lines before. So, it should be OK to switch on
> that 
> variable set and one of the two cases will execute. isn't it? Or am 
> I missing something?

Yes, patch is coming.

> >Unfortunately I don't have enough knowledge to tell if it's simply
> >necessary to fix the switch variable as 
> 
> Get_cur_freq_on_cpu will not work on SYSTEM_IO space as ACPI does not
> have an interface to get the current frequency. It only has a interface
> to say whether the last transitions tried was successful or not.
> So, if indeed a change in switch is required, first option should be
> good...

Hmmmm... I see, the following path fooled me, but re-reading it seems
more obvious what it is doing :)

	get_cur_freq_on_cpu
		extract_freq
			switch (data->cpu_feature) {
			case SYSTEM_INTEL_MSR_CAPABLE:
				return extract_msr(val, data);
			case SYSTEM_IO_CAPABLE:
				return extract_io(val, data);
			...

-- 
mattia
:wq!
