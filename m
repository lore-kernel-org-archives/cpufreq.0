From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Another PIII Coppermine user
Date: Fri, 30 Jan 2004 22:34:49 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040130213449.GF25416@poupinou.org>
References: <401A7D38.5000609@consistec.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <401A7D38.5000609@consistec.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Fischer <philippe.fischer@consistec.de>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>

On Fri, Jan 30, 2004 at 04:50:16PM +0100, Philippe Fischer wrote:
> Hello all,
> 
> I've tried to get the speedstep_smi module work on my  Vaio SR21k  with  
> the params
> smi_port=0xb2 and smi_cmd=0x80 but I've got an error message that my 
> chipset is not supported.
> 

Can you try with smi_cmd=0x82 instead before playing with -piix4 ?

It seems that there are a lot of laptops for which the int15 call return 
0x80 for the command, but is actually 0x82 (those laptops also include
an entry in the registry under Windows in order to get the correct parameter).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
