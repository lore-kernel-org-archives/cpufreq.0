From: Jarek Poplawski <jarkao2@o2.pl>
Subject: Re: 3.2GHz cpus with cpufreq become 2.8GHz
Date: Fri, 20 Oct 2006 09:37:52 +0200
Message-ID: <20061020073752.GC1898@ff.dom.local>
References: <Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S2992558AbWJTHcq@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Oledzki <olel@ans.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On 20-10-2006 00:25, Krzysztof Oledzki wrote:
...
> I will check this, thank you. BTW: what wrong is with p4-clockmod? I was 
> not able to find any information that it is broken and should not be used?

At least it is very suspected:

"Subject: Hardware bug or kernel bug?
On Mon, Oct 16, 2006 at 03:32:38PM +0100, David Johnson wrote:
..
> I've found the culprit - CPU Frequency Scaling.
> With it enabled I get the reboots, with it disabled I don't. That's the same
> with every kernel version I've tried (2.6.19-rc1+rc2, 2.6.17.13 & Centos'
> 2.6.9) The system was using the p4-clockmod driver and the ondemand governor.

> I'm still not sure exactly what the problem is - the reboots only happen in
> the circumstances I've mentioned and are not triggered by changes in clock
> speed alone - but disabling cpufreq seems to make it go away... "

Cheers,

Jarek P.
