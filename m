From: Matthias Hannich <dumb@tcpa-info.org>
Subject: Re: Coppermine, cpufreq
Date: Fri, 31 Oct 2003 13:40:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FA25853.3030100@tcpa-info.org>
References: <3FA11700.8080908@tcpa-info.org>
	<20031030140910.GH28351@poupinou.org>
	<3FA17DDF.5000600@tcpa-info.org>
	<20031031071457.GL28351@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031031071457.GL28351@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Am 10/31/2003 08:14 AM schrieb Ducrot Bruno:
>>>PS: If modprobe speedstep-ich still  do not work
>>>modpbore speedstep-lib
>>
>>No error messages.
>>
>>
>>>modprobe speedstep-ich
>>
> 
> Are you sure you have an ich based system?

00:00.0 Host bridge: Silicon Integrated Systems [SiS] 630 Host (rev 31)
00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513

Sorry, I did completely forgot it.

> BIOS DO NOT support GSIC call.  Dumping registers anyway:
> eax = 0x00008680
> ebx = 0x00000000
> ecx = 0x00000000
> edx = 0x47534943

Was exactly what I got.

Thanks,
Matthias
-- 
Freundliche Gru"?e,          ###  http://www.stop1984.com
Matthias Hannich            ###  nulli@stop1984.com
                             ###  KeyID: 407A2F69
Fingerprint: 600D 7E07 105C F674 0C4B  12C2 4DE4 A8DF 407A 2F69
