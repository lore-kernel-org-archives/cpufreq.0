From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5985] speedstep-smi not detecting speedstep-capability with
	early Pentium 3 Coppermine
Date: Tue, 31 Jan 2006 22:48:23 -0800
Message-ID: <200602010648.k116mNT0001660@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5985





------- Additional Comments From zarhan@cs.tut.fi  2006-01-31 22:48 -------
With the suggested parameters, I get

speedstep-lib: x86: 6, model: 8
speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x4c080020, 0x0
speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x540000
speedstep-lib: early PIII version
speedstep-smi: signature:0x00008680, command:0x0000e6f5, event:0x00000000,
perf_level:0x47534943.
cpufreq-core: trying to register driver speedstep-smi
cpufreq-core: adding CPU 0
speedstep-smi: trying to obtain ownership with command 47534982 at port b2
speedstep-smi: result is 0
speedstep-smi: bug #1422 -- can't read freqs from BIOS
speedstep-smi: could not detect low and high frequencies by SMI call.
speedstep-lib: trying to determine both speeds
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x4c080020 0x0
speedstep-lib: workaround for early PIIIs
speedstep-lib: speed is 500000
speedstep-lib: previous speed is 500000
speedstep-smi: trying to set frequency to state 1 with command 47534982 at port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x4c080020 0x0
speedstep-lib: workaround for early PIIIs
speedstep-lib: speed is 500000
speedstep-lib: low speed is 500000
speedstep-smi: trying to set frequency to state 0 with command 47534982 at port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x4c080020 0x0
speedstep-lib: workaround for early PIIIs
speedstep-lib: speed is 500000
speedstep-lib: high speed is 500000
speedstep-smi: could not detect two different speeds -- aborting.
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver speedstep-smi
cpufreq-core: unregistering CPU 0

  The 500 MHz speed is correct, but that's about it. I don't have MS Windows
available right now, but I'll try that out. Thanks for the tips.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
