From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep-smi module on Omnibook 6000 (2.6.0-test8)
Date: Mon, 20 Oct 2003 18:42:42 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031020164242.GB13989@poupinou.org>
References: <20031020010408.GA2379@beefchickenpork.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031020010408.GA2379@beefchickenpork.org>
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
To: John Chia <orange@geek.com>
Cc: cpufreq@www.linux.org.uk

On Sun, Oct 19, 2003 at 09:04:08PM -0400, John Chia wrote:
> Hi,
> 
> Perhaps someone can help me in my quest to get speedstep working on my
> Omnibook 6000.  It contains the 440BX/ZX/DX/MX chipset, so I assumed it
> would work with the speedstep-smi module included with Linux.  No, it
> doesn't.  This is the output I get when inserting the module:
> 
> speedstep-smi: signature:0x00008680, command:0x0000e6f5,
> event:0x00000000, perf_level:0x47534943.

Your bios do not support GSIC call, so there is really bad luck that
others bios call are ok.
You can try to force with
modprobe speedstep-smi smi_cmd=0x82 smi_port=0xb2
but I doubt that will work (but who knows?).

> 
> Is there anything I can do, probes, utilities or anything, to help
> someone determine how to get this working?
> 
> Thanks in advance,
> Please cc me on replies,
> John.
> 
> PS. there is a module with support called speedstep-piix4 here:
> http://www.poupinou.org/cpufreq/speedstep-piix4.html

Yes, I know.  I was told it is in cpufreq CVS, btw.
What say speedstep-detect?


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
