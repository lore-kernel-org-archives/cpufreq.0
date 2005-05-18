From: Wes Felter <wesley@felter.org>
Subject: Re: Centrino: undervolting and further reducing heat
Date: Wed, 18 May 2005 11:07:04 -0500
Message-ID: <d6fp66$egd$1@sea.gmane.org>
References: <d6f982$h87$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <d6f982$h87$1@sea.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Daniel Bonniot wrote:

> Independently of this feature, I wonder how it's possible to further 
> reduce consumption when the system is mostly ideal, and even 600MHz is 
> more than needed. The idea being to let the system cool down even more 
> in that case. Is there any existing way to achive this on linux? One 
> possibility I found in the intel docs is the IA32_THERM_CONTROL MSR, 
> which can reduce clock speed by 12.5% to 87.5%. Am I right in thinking 
> that it could be combined with speedstep to achieve even lower power 
> consumption states? Are there other possibilities?

Throttling isn't going to help if the system is already mostly halted. 
You're already doing as much as can be done. (Unless there is an 
undocumented setting even lower than 600MHz...)

Wes Felter - wesley@felter.org
