From: Rafal Dejewski <lardel@interia.pl>
Subject: Re: [SPEEDSTEP] ALi shouthbridge.  alpha tester wanted.
Date: Tue, 18 Nov 2003 10:36:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200311181036.17230.lardel@interia.pl>
References: <20031106140935.GC21970@poupinou.org>
	<200311131404.31398.lardel@interia.pl>
	<20031117193947.GV32464@poupinou.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Qgeu/bBdTWGF/wB"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031117193947.GV32464@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq ML <cpufreq@www.linux.org.uk>


--Boundary-00=_Qgeu/bBdTWGF/wB
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 17 November 2003 20:39, Ducrot Bruno wrote:
>
> Can you please send me the output of lspci -xxx, thanks,
Lspci attached.
Don't know if this helps: when I commented out line with "return result;" from 
speedstep_cpu_init function from speedstep-ali.c I did get cpufreq directory 
in /sys. Both scalling_min_freq and scaling_max_freq where equal to 1700000.

Rafal

--Boundary-00=_Qgeu/bBdTWGF/wB
Content-Type: application/x-gzip;
  name="lspci_hp_vt6200.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="lspci_hp_vt6200.gz"

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
f26ppiWqKgAA

--Boundary-00=_Qgeu/bBdTWGF/wB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_Qgeu/bBdTWGF/wB--



