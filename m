From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: cpu governor ondemand issue
Date: Mon, 29 Oct 2007 07:21:29 -0700
Message-ID: <20071029072129.653fe170@laptopd505.fenrus.org>
References: <200710211316.14955.toralf.foerster@gmx.de>
	<20071029000243.9101d363.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758032AbXJ2O0S@vger.kernel.org>
In-Reply-To: <20071029000243.9101d363.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Toralf =?UTF-8?B?RsO2cnN0ZXI=?= <toralf.foerster@gmx.de>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

On Mon, 29 Oct 2007 00:02:43 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> 
> And 2.6.23 was OK?
> 
> Is this problem still present in Linus's current tree?

and did you enable the "ignore nice levels" switch in sysfs ondemand
directory?

-- 
If you want to reach me at my work email, use arjan@linux.intel.com
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
