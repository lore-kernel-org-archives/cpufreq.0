From: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Subject: Re: Call4Response: Correct PST table for ATHLONs
Date: Wed, 02 Jul 2003 17:19:15 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F02F7F3.8050305@searchbroker.de>
References: <3F028F2C.5020704@searchbroker.de> <20030702140206.GP7796@poupinou.org> <3F02EF52.4080908@searchbroker.de> <20030702145100.GQ7796@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030702145100.GQ7796@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Ducrot Bruno wrote:

>>
>>    
>>
>
>well, actually I meant for peoples with 'good' PST.
>  
>
OK - fine ...

>If you look the output from x86info:
>
>  
>
>>Has 28 PST tables. (Only dumping ones relevant to this CPU).
>>    
>>
>      ^^              ^^^^ 
>
>Therefore, by replacing in AMD/dumppst.c
>if ((etuple(cpu) == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
>
>by
>if(1)
>
>you may have hopefully more 'good' PST tables from peoples which have
>good bios perhaps.
>
>  
>
