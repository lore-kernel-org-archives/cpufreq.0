From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: [PATCHES 4/5] speedstep-smi: allow to load it in P4-Ms again
Date: Thu, 10 Feb 2005 01:26:37 +0100
Message-ID: <20050210002637.GB8441@message-id.gmane0305.slipkontur.de>
References: <20050129194335.GD9382@dominikbrodowski.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050129194335.GD9382@dominikbrodowski.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@lists.linux.org.uk

On Sat, Jan 29, 2005 at 08:43:35PM +0100, Dominik Brodowski wrote:
> The speedstep-smi driver actually works on >=1 notebook with a
> Pentium 4-M CPU where all other cpufreq drivers fail. Therefore,
> allow speedstep-smi on P4Ms again, but warn users of likely failure

it works fine on a Thinkpad R32 with a P4M 1.7/1.2G (or is it 1.6/1.2?
not sure, if you want it, i can get more info about the processor,
just tell me what you need).
I'm not sure if other drivers work, i have taken the first stop at
speedstep-smi ;-)
-- 
Stefan Seyfried
