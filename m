From: J Webster <jw.jwebster@gmail.com>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Tue, 08 Feb 2011 08:50:11 +0100
Message-ID: <4D50F5B3.30908@googlemail.com>
References: <4D4DAB6A.6090807@gmail.com> <20110206044123.GB2703@kamineko.org> <201102072055.38707.trenn@suse.de> <4D507895.70204@gmail.com> <4D509E13.6090308@reinelt.co.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dX0cTo1YhdFRFWFJ9SMI0EleQiU1f9mmofN51bWnhzM=;
        b=fv6fKXfqlxHsEu7tKDQBbym/PhYhHmpzIKF43pEzxvykFjEBQv9T4Yz/C9cUA+2+gz
         E5iHzoIS08QYHg43HJw5jlwep1LwfBRX8g4D8ke8iK81uWZafmZTPxnRHQsiPVZyc/r0
         0OjJAW26MO+6UHytSFqUqOPtbYKmkjlwMZ9So=
In-Reply-To: <4D509E13.6090308@reinelt.co.at>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Reinelt <michael@reinelt.co.at>
Cc: J Webster <jw.jwebster@gmail.com>, Thomas Renninger <trenn@suse.de>, Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

Can I do option 1 like this:
Please try creating the file /etc/modprobe.d/processor-ppc.conf
containing the text:

options processor ignore_ppc=1

and then reboot.

How will the boot up options know to use that modprobe?

Is option b a kernel change?

On 08/02/2011 02:36, Michael Reinelt wrote:
> processor.ignore_ppc flag
