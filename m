From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: STPGNT with athlonXP PowerNow
Date: Fri, 5 Sep 2003 15:16:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030905131647.GB408@poupinou.org>
References: <3F55FEF5.7070207@wanadoo.fr>
	<SIMEON.10309031208.A@csisdci19.config.mail.virginia.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <SIMEON.10309031208.A@csisdci19.config.mail.virginia.edu>
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
To: Zhijian Lu <zl4j@virginia.edu>
Cc: Toula Michael <keos@wanadoo.fr>, cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 12:41:08PM -0400, Zhijian Lu wrote:
> Hi,
> I have a question related to this topic:
> Whether the mobile athlonXP will disconnect the bus 
> connection in response to the HLT instruction even ACPI is 
> not installed? Because we observed that the idle power is 
> almost the same no matter what voltage/frequency 
> combination is used(if PLL doesn't stop, the power 
> consumption should be affectecd by the running frequency 
> and voltage)?
> 

In short, I don't know.  HLT does nothing for my laptop
(based upon a Athlon XP-M 2200).  It seems to be possible
to do so (there is some ref. to a MSR called 'CLK_Ctl' but
unfortunately doc for it is available only via NDA apparently).

But since that work via acpi stuff
(replace the 'hlt' by a io read to LVL2 register of the
southbridge) I must admit that I have not searched so hard.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
