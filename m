From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Tue, 27 Jan 2004 10:39:11 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040127093911.GH25416@poupinou.org>
References: <4011EC55.5030304@sbh.eng.br> <20040124060321.GP25416@poupinou.org>
	<4015CFE8.1030002@corp.grupos.com.br>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4015CFE8.1030002@corp.grupos.com.br>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Grando <marcus@corp.grupos.com.br>
Cc: cpufreq@www.linux.org.uk

On Tue, Jan 27, 2004 at 12:41:44AM -0200, Marcus Grando wrote:
> Hi,
> 
> But why my kernel show this messages, if celeron not support speedstep-ich?
> 
> cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
> cpufreq: modules offers voltage scaling in addition of frequency 
> scaling. You
> cpufreq: should use either one instead of p4-clockmod, if possible.
> 

Because this code was added in order to tell people who have a
P4m to take into account the speedstep-ich, etc.  Just that
it seems this code is not able to distinguish yet p4m and celerons...

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
