From: Colin Marquardt <colin@marquardt-home.de>
Subject: Re: 2.6.3-rc3: "powernow-k8: fid 0 invalid : 0x0"
Date: Sat, 28 Feb 2004 02:17:53 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <msgidspam.87eksgypby.fsf@schnee.marquardt-home.de>
References: <msgidspam.87u11h1j4n.fsf@schnee.marquardt-home.de>
	<msgidspam.8765dwi1es.fsf@schnee.marquardt-home.de>
	<20040225085337.GG2869@poupinou.org>
	<msgidspam.87r7wi3ebm.fsf@schnee.marquardt-home.de>
	<20040226111221.GI2869@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040226111221.GI2869@poupinou.org> (Bruno Ducrot's message of
	"Thu, 26 Feb 2004 12:12:21 +0100")
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Bruno Ducrot <ducrot@poupinou.org> writes:

> I meant that you should always compile with ACPI, not APM because
> I doubt that APM nor PnP-BIOS and so on is well tested by bios
> writters for amd64.

Oh, understandable. 

About my problem, I got answer from Paul saying that powernow-k8 was
known to be broken in 2.6.3 and that I should use the files from
2.6.2, and that worked perfectly. And just now, I see the patches
for 2.6.3 too.

Thanks for your help,
  Colin
