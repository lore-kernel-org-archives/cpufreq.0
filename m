From: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 12:10:37 -0400
Message-ID: <426FB97D.3040701@alumni.clemson.edu>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<426F84A8.7040000@alumni.clemson.edu>
	<20050427135402.GZ2298@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427135402.GZ2298@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

Bruno Ducrot wrote:

>On Wed, Apr 27, 2005 at 08:25:12AM -0400, Mark Bidewell wrote:
>  
>
>>Thank you very much for your imput.  I will make those adjustments in 
>>the next patch.  The temperature was obtained by reading 
>>/proc/acpi/thermal_zone/THM/temperature  for a usermode daemon. 
>>
>>    
>>
>
>You mean you cant use ACPI thermal stuff in order to get it right?
>
>  
>

If I understand your question right, I have looked into this.  The functions which extract the raw temperature data use ACPI control structures which appear to be created automagically as part of the file open process.  I have not been able to determine were they are created and so have not been able to call them directly (I am no expert on this by any means so I could be totally off base here).  This would leave opening the /proc file inside the kernel as the only other option and I am not sure that making those kind of calls from kernel mode would be a good idea.
