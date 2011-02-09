From: J Webster <jw.jwebster@gmail.com>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Wed, 09 Feb 2011 20:43:20 +0100
Message-ID: <4D52EE58.4010206@gmail.com>
References: <4D4DAB6A.6090807@gmail.com> <4D509E13.6090308@reinelt.co.at> <4D52E832.9050803@gmail.com> <201102092037.21028.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=TN8tnGqE6ryQ7VrhIW0ial+inj69b0uLWddoZlg8Eok=;
        b=EI+uHot8L4/3LFh67AF/jt4raF0GZY/Fq3C2BH8/FHxQCXthb7lYqeYZCMB/J/JCVQ
         E5CN2FashGGQJstRrOQriLHYJH1XWrLakkNJfuSnRHV7rwurpgVhNSDuyE14wOHdXKjd
         zdN0lqzs3xuoiYA4PBs0ne9dntRkNOK1hDjfA=
In-Reply-To: <201102092037.21028.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>
Cc: Michael Reinelt <michael@reinelt.co.at>, Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

Tried that but it didn;t ignore the BIOS. Either that or something else 
is limiting it.
That's why I had to turn speedstep off in the BIOS.

On 09/02/11 20:37, Thomas Renninger wrote:
> On Wednesday 09 February 2011 20:17:06 J Webster wrote:
>> I have partially solved this by turning off speedstep in the BIOS.
>> Now the computer runs at 1.73 permanently.
>> Is there a way to get cpufreqd to control the speed after that and flip
>> between 800 and 1.73 as needed or is that a function completely
>> controlled by the BIOS?
>> ie now that I have max speed, I guess I have to leave it on max?
> You might want to use processor.ignore_ppc then.
> It ignores BIOS events telling the OS to limit the frequency.
>
>      Thomas
