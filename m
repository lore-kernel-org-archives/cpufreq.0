From: John Chia <orange@geek.com>
Subject: Re: speedstep-smi module on Omnibook 6000 (2.6.0-test8)
Date: Mon, 20 Oct 2003 14:52:05 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031020185205.GA2237@beefchickenpork.org>
References: <20031020010408.GA2379@beefchickenpork.org>
	<20031020164242.GB13989@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031020164242.GB13989@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: John Chia <orange@geek.com>, cpufreq@www.linux.org.uk

Hi Bruno,


On Mon, Oct 20, 2003 at 06:42:42PM +0200, Ducrot Bruno wrote:
> Your bios do not support GSIC call, so there is really bad luck that
> others bios call are ok.
> You can try to force with
> modprobe speedstep-smi smi_cmd=0x82 smi_port=0xb2
> but I doubt that will work (but who knows?).

Thanks for the help.  I tried to force the module in as you said, and it
loads successfully, but this is what I get:

speedstep-smi: signature:0x00008680, command:0x0000e6f5,
event:0x00000000, perf_level:0x47534943.
speedstep-smi: could not detect low and high frequencies by SMI call.
cpufreq: change failed
speedstep-smi: could not detect two different speeds -- aborting.

> Yes, I know.  I was told it is in cpufreq CVS, btw.  What say
> speedstep-detect?

Where can I find speedstep-detect?

John.
