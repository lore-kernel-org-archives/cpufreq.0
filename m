From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Mon, 29 Nov 2004 22:36:38 +0100
Message-ID: <41AB9666.5060801@inbox.ru>
References: <200410150905.08176.Hendrik.Muhs@web.de>
	<41704EFD.9030107@inbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <41704EFD.9030107@inbox.ru>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Still can't set multiplier 11. I'm able to run CPU on 10.5x200, but not 
at 11x200. If I use

powernow-k7 overwrite_table=1 multiplier=50,60,70,80,90,110

or

powernow-k7 overwrite_table=1 multiplier=50,60,70,80,90,11

maximum frequency becomes 1800MHz (9x200) and it's second to last 
multiplier...




Nebojsa Trpkovic wrote:

> Hendrik Muhs wrote:
>
>> You found a bug! There is an error in the translation table:
>>
>> +/* translation table for odd multiplier to fid*/
>> +static int odd_multiplier[9]={
>> +    5, 7, 9, 11, 12, 13, 1, 3,        +   
>> 21,                                      +};
>>
>> should be (13 instead of 12, 15 instead of 13):
>>
>> +/* translation table for odd multiplier to fid*/
>> +static int odd_multiplier[9]={
>> +    5, 7, 9, 11, 13, 15, 1, 3,       +   
>> 21,                                      +};
>>
>> A new corrected patch is attached to this mail
>>
>> Hendrik
>>  
>>
>>
> That works!
>
> Finaly I have my Barton 2500+ fully modded :D
>
> First, I've set it's FSB from 166MHz to 200MHz (L12 mod)
> and then it became Mobile (L5 mod)
>
> Now it runs at 1GHz and switchs to 2.1GHz if needed instead of boring 
> 1833MHz :D
>
>
> Great work!
> Thank you all!
>
