From: Matthias-Christian Ott <matthias.christian@tiscali.de>
Subject: Re: [PATCH]: speedstep-lib: fix frequency multiplier for Pentium4
 models 0&1
Date: Sat, 22 Jan 2005 15:32:59 +0100
Message-ID: <41F2641B.3090506@tiscali.de>
References: <41F259C4.9020903@tiscali.de> <20050122142353.GB19194@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262723AbVAVOd2@vger.kernel.org>
In-Reply-To: <20050122142353.GB19194@devserv.devel.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjanv@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, cpufreq@zenII.linux.org.uk, "H. Peter Anvin" <hpa@zytor.com>, Dominik Brodowski <linux@brodo.de>, Zwane Mwaikambo <zwane@commfireservices.com>, Linus Torvalds <torvalds@osdl.org>

Arjan van de Ven wrote:

>On Sat, Jan 22, 2005 at 02:48:52PM +0100, Matthias-Christian Ott wrote:
>  
>
>>The Pentium4 models 0&1 have a longer MSR_EBC_FREQUENCY_ID register as 
>>the models 2&3, so the bit shift must be bigger.
>>    
>>
>
>I would feel safer if this checked that it was actually a p4 as well...
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>  
>
Hi!
If mean my CPU, it's a pentium4 model 1 and the patch is checked with it.
All other tests which check if it's a pentium4 are performed by other 
instances of the cpufreq driver.

Matthias-Christian Ott
