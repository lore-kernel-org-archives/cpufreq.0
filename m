From: paul.devriendt@amd.com
Subject: RE: powernow-k8-acpi driver
Date: Wed, 3 Mar 2004 17:57:35 -0600
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <99F2150714F93F448942F9A9F112634C109A3935@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pavel@suse.cz, davej@redhat.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, davej@codemonkey.ork.uk

> One more thing: is there any reason for "use-array-as-struct"?
> 
> static int query_current_values_with_pending_wait(u8 *perproc) { ...
>         perproc[PP_OFF_CVID] = hi & MSR_S_HI_CURRENT_VID;
>         perproc[PP_OFF_CFID] = lo & MSR_S_LO_CURRENT_FID; }
> 
> having 
> 
> struct cpu_power {
> 	int numps, share, cvid, cfid;
> 	char pstates[0];
> }
> 
> should do the trick...
> 							Pavel

Yes, I could get rid off the PP_OFF_crud using something like you
suggest. I'll do that while I am also doing the back port and get
them both out next week sometime.

Paul.
